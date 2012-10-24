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
	import com.bless.containers.layouts.BaseLayout;

	/**
	 * Container 类是组件的抽象基类，用于控制子组件的布局特征。您没有在应用程序中创建 Container 实例，
	 * 而是创建 Container 子类之一的实例，如 Canvas 或 HBox。 
	 * Container 类包含用于滚动、剪裁和动态实例化的逻辑。
	 * 它包含用于添加和删除子项的方法。它还包含 getChildAt() 方法和用于绘制容器背景和边框的逻辑。
	 *
	 */
	public class Container extends UIComponent
	{
		private var _layout:BaseLayout;
		/**
		 * 水平方向 子级显示对象的间距 
		 */		
		public var horizontalGap:Number = 0;
		/**
		 * 垂直方向 子级显示对象的间距 
		 */
		public var verticalGap:Number = 0;
		/**
		 * 内容和四边边框之间的间距大小 
		 */		
		public　var padding:Number = 0;
		/**
		 * 容器内容的宽度 
		 */		
		private var _contentWidth:Number = 0;
		private var _contentHeight:Number = 0;
		private var _childMaxHeight:Number = 0;
		private var _childMinHeight:Number = 0;
		private var _childMaxWidth:Number = 0;
		private var _childMinWidth:Number = 0;
		
		public function set layout(value:BaseLayout):void
		{
			_layout = value;
		}
		
		public function get layout():BaseLayout{
			return _layout;
		}
		
		public function get childMaxHeight():Number
		{
			return _childMaxHeight;
		}
		
		public function get childMaxWidth():Number
		{
			return _childMaxWidth;
		}
		
		public function get childMinHeight():Number
		{
			return _childMinHeight;
		}
		
		public function get childMinWidth():Number
		{
			return _childMinWidth;
		}
		
		public function set childMaxHeight(value:Number):void
		{
			_childMaxHeight = value;
		}
		
		public function set childMaxWidth(value:Number):void
		{
			_childMaxWidth = value;
		}
		
		public function set childMinHeight(value:Number):void
		{
			_childMinHeight = value;
		}
		
		public function set childMinWidth(value:Number):void
		{
			_childMinWidth = value;
		}
		
		/**
		 * HGroup显示内容的高度 
		 */
		public function get contentHeight():Number
		{ 
			return _contentHeight;
		}

		/**
		 * @private
		 */
		public function set contentHeight(value:Number):void
		{
			if(_contentHeight != value){
				measuredHeight = _contentHeight = value;
			}
		}

		public function get contentWidth():Number
		{
			return _contentWidth;	
		}
		
		override public function get explicitOrMeasuredHeight():Number
		{
			return isNaN(explicitHeight)?contentHeight:explicitHeight;
		}
		
		override public function get explicitOrMeasuredWidth():Number
		{
			return isNaN(explicitWidth)?contentWidth:explicitWidth;	
		}
		
		public function set contentWidth(value:Number):void
		{
			if(_contentWidth != value){
				measuredWidth = _contentWidth = value;
			}
		}
		
		public function Container()
		{
			super();
			layout = new BaseLayout(this);
		}
	}
}