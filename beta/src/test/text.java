package test;

import java.net.*;
import java.io.*;

import org.json.JSONException;
import org.json.JSONObject;

public class text {
	
	public JSONObject aa (String url1){
		URL url;
		String strs="";
		String line="";
		try {
			//url = new URL("http://2019ncov.bioon.com/rumors.json");
			url = new URL(url1);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36)");
			connection.connect();
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));
			while((line=reader.readLine())!=null){
				strs+=line;
			}
			reader.close();
			connection.disconnect();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject jsonObject = null;
		try {
			jsonObject = new JSONObject(strs);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	public static void main(String[] args) {
		text text = new text();
		//JSONObject s = text.aa();
		//System.out.println(s);
		
		
	}
	public JSONObject xq (String str){
		String str2 = null;
		try {
			str2=URLEncoder.encode(str, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url = "https://api.inews.qq.com/newsqa/v1/query/pubished/daily/list?province="+str2+"&";
		text text = new text();
		String string = text.aa(url).toString();
		JSONObject json = null;
		try {
			string = java.net.URLDecoder.decode(string,"UTF-8");
			json = new JSONObject(string);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
}
