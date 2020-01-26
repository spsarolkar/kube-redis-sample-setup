package io.github.spsarolkar.fortunetellerui;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import java.net.InetAddress;
import java.util.Map;

@Controller
public class FortuneTeller {

    @GetMapping(path = "/")
    public String index(Model model) {
        model.addAttribute("wemcome","welcome");
        return "index";
    }

    @Autowired
    @Qualifier("fortuneRestService")
    private RestTemplate restTemplate;

    @Autowired
    private InetAddress inetAddress;

    @Autowired
    private AppConfig appConfig;

    @GetMapping("/home")
    public String home(OAuth2Authentication authentication, Model model) {

        ResponseEntity<Message> res=restTemplate.getForEntity("http://"+appConfig.getCowsayServer()+":"+appConfig.getCowsayServerPort()+"/fortune/",Message.class);
        model.addAttribute("remoteServerName",res.getBody().getServerName());
        model.addAttribute("message",res.getBody().getMessage());
        model.addAttribute("serverName",inetAddress.getHostName());
        model.addAttribute("userName",((Map) authentication.getUserAuthentication().getDetails()).get("name"));
        //return "Welcome "+((Map)authentication.getUserAuthentication().getDetails()).get("name")+", serverName="+res.getBody().getServerName()+", message <br/><pre>"+ res.getBody().getMessage()+"</pre>";
        return "home";
    }


}
