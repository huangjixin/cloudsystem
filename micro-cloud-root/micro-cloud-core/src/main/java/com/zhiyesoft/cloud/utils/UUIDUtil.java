package com.zhiyesoft.cloud.utils;
import java.util.UUID;

public class UUIDUtil {
	
    public static String generateID() {  
       UUID.randomUUID();
       return UUID.randomUUID().toString().replaceAll("-", ""); 
    }  
}