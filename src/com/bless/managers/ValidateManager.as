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
	import com.bless.core.UIComponent;

	/**
	 * <p>在该类中调用延迟处理管理器</p>
	 * <p>该类是一个单例类 用来管理整个应用程序中的组件</p>
	 *
	 */
	public class ValidateManager
	{
		private static var instance:ValidateManager;
		public var phaseQueue:Array = [];
		
		public static function getInstance():ValidateManager
		{
			if(!instance){
				instance = new ValidateManager;
			}
			return instance;
		}
		
		
		public function invalidateProperties(ui:UIComponent):void
		{
			if(ui.stage){
				ui.invalidatePropertiesFlag = true;
				phaseQueue.push(ui.validateProperties);
				var numChildren:int = ui.numChildren;
				var uiComp:UIComponent;
				for(var i:int = 0;i<numChildren;i++){
					uiComp = ui.getChildAt(i) as UIComponent;
					if(uiComp){
						uiComp.invalidatePropertiesFlag = true;
						phaseQueue.push(uiComp.validateProperties);
					}
				}
				attachListenerForRender(ui);
			}
		}
		
		public function invalidateSize(ui:UIComponent):void
		{
			if(ui.stage){
				ui.invalidateSizeFlag = true;
				var numChildren:int = ui.numChildren;
				var uiComp:UIComponent;
				for(var i:int = 0;i<numChildren;i++){
					uiComp = ui.getChildAt(i) as UIComponent;
					if(uiComp){
						uiComp.invalidateSizeFlag = true;
						phaseQueue.push(uiComp.validateSize);
					}
				}
				phaseQueue.push(ui.validateSize);
				attachListenerForRender(ui);
			}
		}
		
		/**
		 * 此处将ui的所有子级对象 的validateDisplayList方法都压入方法队列中 
		 * @param ui
		 * 
		 */		
		public function invalidateDisplayList(ui:UIComponent):void
		{
			if(ui.stage){
				ui.invalidateDisplayListFlag = true;
				var numChildren:int = ui.numChildren;
				var uiComp:UIComponent;
				for(var i:int = 0;i<numChildren;i++){
					uiComp = ui.getChildAt(i) as UIComponent;
					if(uiComp){
						uiComp.invalidateDisplayListFlag = true;
						phaseQueue.push(uiComp.validateDisplayList);
					}
				}
				phaseQueue.push(ui.validateDisplayList);
				attachListenerForRender(ui);
			}
		}
		
		
		public function attachListenerForRender(ui:UIComponent):void
		{
			OverlayRenderManager.getInstance().renderLater(ui);
		}
	}
}