//////////////////////////////////////////////
//
//BlessFramework
//Copyright 2012 
//Author:BlessMan QQ:506896470 
//E-mail:chaibingcheng0305@163.com
//
//////////////////////////////////////////////
package com.bless.containers
{
	import com.bless.containers.layouts.VerticalLayout;

	/**
	 *垂直布局组件的容器
	 *
	 */
	public class VGroup extends Group
	{
		private var _childMaxWidth:Number = 0;
		public function VGroup()
		{
			super();
			layout = new VerticalLayout(this);
		}
		/**
		 * 如果没有明确设置Vgroup的宽度 那么容器的最大宽度就是该容器的宽度 
		 * @param value
		 * 
		 */		
		override public function set childMaxWidth(value:Number):void
		{
			if(childMaxWidth!=value){
				_childMaxWidth = value;
				contentWidth = value;
			}
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();	
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
		}
		
		override protected function measure():void{
			super.measure();
			layout.measure();
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			layout.layout();
		}
		
		
	}
}