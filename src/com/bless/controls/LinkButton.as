//////////////////////////////////////////////
//
//BlessFramework
//Copyright 2012 
//Author:BlessMan QQ:506896470 
//E-mail:chaibingcheng0305@163.com
//
//////////////////////////////////////////////
package com.bless.controls
{
	import com.bless.core.UIComponent;
	
	import flash.events.MouseEvent;
	
	/**
	 * LinkButton 控件是没有边框的 Button 控件，当用户将鼠标移动到该控件位置时，其内容将加亮显示。
	 *
	 */
	public class LinkButton extends Button
	{
		private var _normalColor:uint = 0x333333;
		private var _rollOverColor:uint = 0xEEFEE6;
		private var _selectionColor:uint = 0xB7F39B;
		private var _textRollOverColor:uint = 0x2B333C;
		private var _textSelectionColor:uint = 0x2B333C;
		private var _cornorRadius:Number = 4;
		private var _currentBgColor:uint;
		
		/**
		 * 正常状态的背景颜色
		 * @return 
		 * 
		 */		
		public function get normalColor():uint
		{
			return _normalColor;
		}

		public function set normalColor(value:uint):void
		{
			_normalColor = value;
		}

		
		/**
		 * 当前的背景颜色 
		 * @return 
		 * 
		 */
		public function get currentBgColor():uint
		{
			return _currentBgColor;
		}

		public function set currentBgColor(value:uint):void
		{
			_currentBgColor = value;
		}


		/**
		 * 当用户将鼠标指针移动到某个 LinkButton 位置时，该按钮的颜色。 默认值为 0xEEFEE6. 
		 * @return 
		 * 
		 */		
		public function get rollOverColor():uint
		{
			return _rollOverColor;
		}

		public function set rollOverColor(value:uint):void
		{
			_rollOverColor = value;
		}
		/**
		 *当用户按压某个 LinkButton 控件时，该按钮的背景颜色。 默认值为 0xB7F39B. 
		 * @return 
		 * 
		 */
		public function get selectionColor():uint
		{
			return _selectionColor;
		}

		public function set selectionColor(value:uint):void
		{
			_selectionColor = value;
		}
		/**
		 *当用户将鼠标指针移动到某个 LinkButton 控件位置时，该按钮的文本颜色。 默认值为 0x2B333C. 
		 * @return 
		 * 
		 */
		public function get textRollOverColor():uint
		{
			return _textRollOverColor;
		}

		public function set textRollOverColor(value:uint):void
		{
			_textRollOverColor = value;
		}
		/**
		 *当用户按压某个 LinkButton 控件时，该按钮的文本颜色。 默认值为 0x2B333C. 
		 * @return 
		 * 
		 */
		public function get textSelectionColor():uint
		{
			return _textSelectionColor;
		}

		public function set textSelectionColor(value:uint):void
		{
			_textSelectionColor = value;
		}
		/**
		 * 环绕 LinkButton 的加亮矩形的顶点半径。 默认值为 4. 
		 * @return 
		 * 
		 */
		public function get cornorRadius():Number
		{
			return _cornorRadius;
		}

		public function set cornorRadius(value:Number):void
		{
			_cornorRadius = value;
		}

		/**
		 * 绘制背景 
		 * 
		 */		
		override protected function drawBg():void
		{
			if(currentBgColor){
				graphics.clear();
				graphics.beginFill(currentBgColor,backgroundAlpha);
				graphics.drawRoundRect(0,0,explicitOrMeasuredWidth,explicitOrMeasuredHeight,cornerRadius,cornerRadius);
				graphics.endFill();
			}
		}
		

		protected override function downHandler(event:MouseEvent):void
		{
			//TODO Auto-generated method stub
			super.downHandler(event);
			currentBgColor = selectionColor;
			drawBg();
		}

		protected override function outHandler(event:MouseEvent):void
		{
			//TODO Auto-generated method stub
			super.outHandler(event);
			currentBgColor = normalColor;
			drawBg();
		}

		protected override function upHandler(event:MouseEvent):void
		{
			//TODO Auto-generated method stub
			super.upHandler(event);
			currentBgColor = rollOverColor;
			drawBg();
		}
		protected override function overHandler(event:MouseEvent):void
		{
			//TODO Auto-generated method stub
			super.overHandler(event);
			currentBgColor = rollOverColor;
			drawBg();
		}
		
		protected override function commitProperties():void
		{
			super.commitProperties();
			if(normalColor){
				currentBgColor = normalColor;
			}
		}
		
		/**
		 * 构造方法 
		 * 
		 */		
		public function LinkButton()
		{
			super();
		}
	}
}