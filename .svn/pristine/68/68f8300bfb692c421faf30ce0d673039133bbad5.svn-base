package com.col.test.compiler;

import net.openhft.compiler.CompilerUtils;

import java.util.List;


public class JavaCompiler {
	public void javaComile(String javaSource, int input){
		String className = "mypackage.MyClass";


		String javaCode = "package mypackage;\n" +
				"public class MyClass implements Runnable {\n" +
				"    public int run() {\n" +
				"        System.out.println(\"test\");" +
				"		 soultion(int "+input+");"+
				"    }\n" +
				javaSource+
				"}\n";
		Class aClass = null;
		Runnable runner = null;

		try {
			aClass = CompilerUtils.CACHED_COMPILER.loadFromJava(className, javaCode);
			runner = (Runnable) aClass.newInstance();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		runner.run();
	}
}
