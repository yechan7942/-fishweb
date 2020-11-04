package global.sesoc.good.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.good.HomeController;
import global.sesoc.good.vo.Board;
import global.sesoc.good.vo.GuestBook;

@Controller
@RequestMapping("service")
public class ServiceController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/search", method =RequestMethod.GET)
	public String insert(Board b, Model m) {
		
		m.addAttribute("b", b);
		return "service/search";
	}

	@ResponseBody
	@RequestMapping(value = "fish", method=RequestMethod.GET,produces = "application/text;charset=utf-8")
		public String protectData(String type, String searchKey) throws ServletException, IOException {
		      
		      // 인증키로 해당 데이터 요구하는 url 작성
		      StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551979/marineOrganismInhabitInfoService/getHabitatGisList");
		      urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=92G4%2FvLvNrCcWn4YfAG5i53WjQv%2FGHYYXCjpQDkFrauxMieGgtrCSWYdhOKfSkTwyvTyT2pFDQEf9GyPbeKlNA%3D%3D");
		      urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="+ URLEncoder.encode("", "UTF-8"));
		      urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "="+ URLEncoder.encode("1","UTF-8"));
		      urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "="+ URLEncoder.encode("json", "UTF-8"));
		      urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "="+ URLEncoder.encode(type,"UTF-8"));
		      urlBuilder.append("&" + URLEncoder.encode("searchKey", "UTF-8") + "="+ URLEncoder.encode(searchKey,"UTF-8"));
		      //urlBuilder.append("&" + URLEncoder.encode("monum", "UTF-8") + "="+ URLEncoder.encode("","UTF-8"));
		      
		      // 접근하기 위한 url 생성
		      URL url = new URL(urlBuilder.toString());
		      
		      // GET 방식으로 해당 url 접근
		      HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		      urlconnection.setRequestMethod("GET");
		      
		      // 접근 후 처리 된 데이터를 가져오기
		      BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
		      String result = "";
		      String line;
		      while((line = br.readLine()) != null) {
		         result = result + line + "\n";
		      }
		    
		      
		      return result;
		 		
	}
	
	@RequestMapping(value = "/fun", method = RequestMethod.GET)
	public String fun() {
		
				
		return "service/fun";
	}
}
