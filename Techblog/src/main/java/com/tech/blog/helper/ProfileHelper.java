package com.tech.blog.helper;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Path;

public class ProfileHelper {
public static boolean saveProfile(InputStream is,String path) {
	boolean f=false;
	try {
	byte[] data=new byte[is.available()];
	is.read(data);
	FileOutputStream fos=new FileOutputStream(path);
	fos.write(data);
	fos.flush();
	fos.close();
	f=true;
	}catch(Exception e) {
		e.printStackTrace();
	}
	return f;
}
}
