package ua.com.codefire.web.controller;

import org.pac4j.core.context.J2EContext;
import org.pac4j.core.context.WebContext;
import org.pac4j.core.profile.ProfileManager;
import org.pac4j.core.profile.UserProfile;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by human on 6/1/16.
 */
@Controller
public class MainController {

    @ResponseStatus(HttpStatus.TEMPORARY_REDIRECT)
    @RequestMapping({"/index"})
    public String getIndex() {
        return "redirect:/";
    }

    @RequestMapping({"/"})
    public String getIndex(Model model, HttpServletRequest request, HttpServletResponse response) {
        model.addAttribute("profile", getProfile(new J2EContext(request, response)));
        model.addAttribute("wing", "Hello World!");

        return "index";
    }

    @ResponseStatus(HttpStatus.TEMPORARY_REDIRECT)
    @RequestMapping({"/downloads"})
    public String getDownloads(Model model, HttpServletRequest request, HttpServletResponse response) {
        model.addAttribute("profile", getProfile(new J2EContext(request, response)));

        return "downloads";
    }


    /**
     * Getting prfile.
     * @param context
     * @return user profile object.
     */
    private UserProfile getProfile(WebContext context) {
        final ProfileManager manager = new ProfileManager(context);
        return manager.get(true);
    }
}
