package pl.physio.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DataParser {
	
	public static java.sql.Date dateParser(String date) {
		
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsed;
		try {
			parsed = format.parse(date);
			java.sql.Date sql = new java.sql.Date(parsed.getTime());
			System.out.println(sql);
			return sql;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

}
