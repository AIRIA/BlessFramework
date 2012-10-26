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
	import com.bless.containers.HGroup;
	
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	/**
	 *  在使用框架的程序中 主程序需要继承此类
	 *
	 */
	public class Application extends Container
	{
		/**
		 * 程序启动的时候 调用的方法 
		 */		
		protected var init:Function = null;
		
		/**
		 * <p>构造方法</p> 
		 * 
		 */		
		public function Application()
		{
			ApplicationGlobals.application = this;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			this.nestLevel = 2;
			addEventListener(Event.ADDED_TO_STAGE,updateAppHandler);
		}
		
		
		private function updateAppHandler(event:Event):void
		{
			ApplicationGlobals.application.width = stage.stageWidth;
			ApplicationGlobals.application.height = stage.stageHeight;
			if(init!=null){
				init();				
			}else{
//				throw new Error("没有重写程序的初始化方法",0);
			}
		}
	}
}