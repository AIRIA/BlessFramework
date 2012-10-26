//////////////////////////////////////////////
//
//BlessFramework
//Copyright 2012 
//Author:BlessMan QQ:506896470 
//E-mail:chaibingcheng0305@163.com
//
//////////////////////////////////////////////
package com.bless.core
{
	import flash.text.TextField;
	
	/**
	 * BlessTextField 是 Player 的 TextField 类的子类，同时也是 UITextField 的 superclass。它将覆盖 toString() 方法以返回一个字符串，用于指示对象在应用程序的 DisplayObject 层次结构中所处的位置
	 * 
	 */
	public class BlessTextField extends TextField
	{
		public function BlessTextField()
		{
			super();
		}
		
		
		public override function toString():String
		{
			return super.toString();
		}


	}
}