package tody.lovely.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tody.lovely.exception.AlreadyExistingEmailException;
import tody.lovely.exception.AlreadyExistingIdException;
import tody.lovely.service.UserService;
import tody.lovely.util.RegisterRequest;
import tody.lovely.util.RegisterRequestValidator;

@Controller
public class UserController {
	@RequestMapping("/register/step1")
	public String step1() throws Exception {
		return "/user/register/step1";
	}

	@RequestMapping("/register/step2")
	public ModelAndView step2(@RequestParam(value = "agree", defaultValue = "false") Boolean agree) throws Exception {
		if (!agree) {
			ModelAndView mv = new ModelAndView("user/register/step1");
			return mv;
		}
		ModelAndView mv = new ModelAndView("user/register/step2");
		mv.addObject("registerRequest", new RegisterRequest());
		return mv;
	}

	@Resource(name = "userService")
	private UserService userSer;

	@RequestMapping("/register/step3")
	public ModelAndView step3(RegisterRequest regReq, Errors errors) throws Exception {
		new RegisterRequestValidator().validate(regReq, errors);
		if (errors.hasErrors()) {
			ModelAndView mv = new ModelAndView("user/register/step2");
			return mv;
		}
		try {
			userSer.register(regReq);
		} catch (AlreadyExistingEmailException e) {
			errors.rejectValue("email", "duplicate", "이미 가입된 이메일입니다.");
			ModelAndView mv = new ModelAndView("user/register/step2");
			return mv;
		} catch (AlreadyExistingIdException e) {
			errors.rejectValue("id", "duplicate", "이미 가입된 아이디입니다.");
			ModelAndView mv = new ModelAndView("user/register/step2");
			return mv;
		}
		ModelAndView mv = new ModelAndView("user/register/step3");
		return mv;
	}

}
