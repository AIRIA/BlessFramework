//////////////////////////////////////////////
//
//BlessFramework
//Copyright 2012 
//Author:BlessMan QQ:506896470 
//E-mail:chaibingcheng0305@163.com
//
//////////////////////////////////////////////
package com.bless.managers
{
	import com.bless.core.ApplicationGlobals;
	import com.bless.core.UIComponent;
	
	import flash.events.Event;

	/**
	 * 延迟渲染的管理器  将方法压入方法队列中
	 *
	 */
	public class OverlayRenderManager
	{
		private static var instance:OverlayRenderManager;
		
		private var client:UIComponent;
		
		public static function getInstance():OverlayRenderManager{
			if(!instance){
				instance = new OverlayRenderManager;
			}
			return instance;
		}
		
		public function renderLater(ui:UIComponent):void
		{
			client = ui;
			ApplicationGlobals.application.addEventListener(Event.ENTER_FRAME,doRenderCallback);
			if(ui&&ui.stage){
				ApplicationGlobals.application.addEventListener(Event.RENDER,doRenderCallback);
				ApplicationGlobals.application.stage.invalidate();
			}
			
		}
		
		private function doRenderCallback(event:Event):void
		{
			trace(event.type);
			ApplicationGlobals.application.removeEventListener(Event.RENDER,doRenderCallback);
			ApplicationGlobals.application.removeEventListener(Event.ENTER_FRAME,doRenderCallback);
			doRender();
		}
		
		private function doRender():void
		{
			trace("begin render");
			while(ValidateManager.getInstance().phaseQueue.length){
				ValidateManager.getInstance().phaseQueue[0]();
				ValidateManager.getInstance().phaseQueue.shift();
			}
		}
	}
}