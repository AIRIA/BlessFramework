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
	import com.bless.containers.layouts.HorizontalLayout;

	/**
	 *  HGroup容器在单个水平行中布置其子容器
	 */
	public class HGroup extends Group
	{
		/**
		 *构造方法 
		 * 
		 */		
		public function HGroup(){
			layout = new HorizontalLayout(this);
		}
		
		/**
		 * 在HGroup中 子项中 高度最大的就是Hgroup的内容的高度 
		 * @param value
		 * 
		 */		
		override public function set childMaxHeight(value:Number):void
		{
			if(childMaxHeight!=value){
				super.childMaxHeight = value;
				contentHeight = value;
			}
		}
		
		protected override function commitProperties():void
		{
			super.commitProperties();
		}

		protected override function createChildren():void
		{
			super.createChildren();
		}

		protected override function measure():void
		{
			super.measure();
			layout.measure();
		}

		protected override function updateDisplayList():void
		{
			super.updateDisplayList();
			layout.layout();
		}
	}
}