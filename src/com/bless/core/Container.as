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
	
	import flash.display.DisplayObject;

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
		
		private var _backgroundColor:uint;
		private var _cornerRadius:Number = 0.0;
		private var _backgroundAlpha:Number = 1;
		private var _borderWeight:Number = 1;
		private var _borderColor:uint;
		
		private var _verticalAlign:String;
		private var _horizontalAlign:String;
		
		/**
		 * 水平对齐方式 
		 * @return 
		 * 
		 */		
		public function get verticalAlign():String
		{
			return _verticalAlign;
		}
		/**
		 * 垂直对齐方式 
		 * @return 
		 * 
		 */		
		public function get horizontalAlign():String{
			return _horizontalAlign;
		}
		
		public function set veticalAlign(value:String):void
		{
			if(_verticalAlign!=value){
				_verticalAlign =value;
			}
		}
		
		public function set horizontalAlign(value:String):void
		{
			if(_horizontalAlign!=value){
				_horizontalAlign = value;
			}
		}
		/**
		 * 容器的背景颜色 
		 * @return 
		 * 
		 */		
		public function get backgroundColor():uint
		{
			return _backgroundColor;
		}
		public function set backgroundColor(value:uint):void
		{
			if(_backgroundColor!=value){
				_backgroundColor = value;
				invalidateProperties();
				invalidateDisplayList();
			}
		}
		/**
		 * 容器的背景圆角半径 
		 * @return 
		 * 
		 */		
		public function get cornerRadius():Number
		{
			return _cornerRadius;
		}
		
		public function set cornerRadius(value:Number):void
		{
			if(_cornerRadius!=value){
				_cornerRadius = value;
				invalidateProperties();
				invalidateDisplayList();
			}
		}
		/**
		 * 容器背景的透明度 
		 * @return 
		 * 
		 */		
		public function get backgroundAlpha():Number
		{
			return _backgroundAlpha;
		}
		
		public function set backgroundAlpha(value:Number):void
		{
			if(_backgroundAlpha!=value){
				_backgroundAlpha = value;
				invalidateProperties();
				invalidateDisplayList();
			}
		}
		/**
		 * 容器的边框粗细
		 * @return 
		 * 
		 */		
		public function get borderWeight():Number
		{
			return _borderWeight;	
		}
		
		
		/**
		 * 容器的边框颜色 
		 * @return 
		 * 
		 */		
		public function get borderColor():uint
		{
			return _borderColor;
		}
		
		public function set borderWeight(value:Number):void
		{
			if(_borderWeight!=value){
				_borderWeight = value;
				invalidateProperties();
				invalidateDisplayList();
			}
		}
		
		public function set borderColor(value:uint):void
		{
			if(_borderColor!=value){
				_borderColor = value;
				invalidateProperties();
				invalidateDisplayList();
			}
		}
		
		/**
		 * 绘制背景的方法 
		 * 
		 */		
		public function draw():void
		{
			if(stage){
				//只有添加到舞台上后 才进行绘制
				if(backgroundColor){
					graphics.clear();
					if(borderColor){
						graphics.lineStyle(borderWeight,borderColor);
					}
					graphics.beginFill(backgroundColor,backgroundAlpha);
					graphics.drawRoundRect(0,0,explicitOrMeasuredWidth,explicitOrMeasuredHeight,cornerRadius,cornerRadius);
					graphics.endFill();
				}
			}
		}
		
		override protected function updateDisplayList():void{
			super.updateDisplayList();
			draw();
		}
		
		public function set layout(value:BaseLayout):void
		{
			_layout = value;
		}
		
		/**
		 * 容器使用的布局管理器 
		 * @return 
		 * 
		 */		
		public function get layout():BaseLayout{
			return _layout;
		}
		
		/**
		 * 容器中高度最大的child的高度
		 * @return 
		 * 
		 */		
		public function get childMaxHeight():Number
		{
			return _childMaxHeight;
		}
		/**
		 * 容器中宽度最大的child的宽度
		 * @return 
		 * 
		 */		
		public function get childMaxWidth():Number
		{
			return _childMaxWidth;
		}
		/**
		 *容器中高度最小的child的高度 
		 * @return 
		 * 
		 */		
		public function get childMinHeight():Number
		{
			return _childMinHeight;
		}
		/**
		 *容器中宽度最小的child的宽度 
		 * @return 
		 * 
		 */		
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
		/**
		 * 容器中 显示内容的宽度 
		 * @return 
		 * 
		 */
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
		/**
		 * 构造函数 
		 * 
		 */		
		public function Container()
		{
			super();
			layout = new BaseLayout(this);
		}
	}
}