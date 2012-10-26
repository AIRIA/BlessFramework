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
	import com.bless.core.UITextField;
	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextLineMetrics;
	
	/**
	 *  
	 * 
	 */
	public class Button extends UIComponent
	{
		private var _icon:Image;
		private var _textField:UITextField;
		private var _label:String;
		private var _padding:Number = 3;
		private var _labelStyle:TextFormat;
		private var _cornerRadius:Number = 4;
		
		/**
		 * 背景矩形的圆角半径 
		 * @return 
		 * 
		 */		
		public function get cornerRadius():Number
		{
			return _cornerRadius;
		}

		public function set cornerRadius(value:Number):void
		{
			_cornerRadius = value;
		}

		
		/**
		 * Button中文字的样式 
		 * @return 
		 * 
		 */		
		public function get labelStyle():TextFormat
		{
			if(!_labelStyle){
				//设置默认的labelStyle
				_labelStyle = new TextFormat("宋体",14,0xFFFFFF,false,false,false,null,null,TextFormatAlign.CENTER);
			}
			return _labelStyle;
		}

		public function set labelStyle(value:TextFormat):void
		{
			_labelStyle = value;
		}

		
		/**
		 * 文字前的图标 
		 * @return 
		 * 
		 */		
		public function get icon():Image
		{
			return _icon;
		}

		public function set icon(value:Image):void
		{
			_icon = value;
		}
		
		public function get textField():UITextField
		{
			return _textField;
		}

		public function set textField(value:UITextField):void
		{
			_textField = value;
		}
		
		/**
		 * Button边框和文字之间的距离 
		 * @return 
		 * 
		 */		
		public function get padding():Number
		{
			return _padding;
		}

		public function set padding(value:Number):void
		{
			_padding = value;
		}

		
		/**
		 * button上显示的文字 
		 * @return 
		 * 
		 */
		public function get label():String
		{
			return _label;
		}

		public function set label(value:String):void
		{
			if(_label!=value){
				_label = value;
				if(textField){
					textField.text = label;
					invalidateProperties();
					invalidateDisplayList();
				}
			}
		}
		
		public function Button()
		{
			super();
		}
		
		protected override function commitProperties():void
		{
			super.commitProperties();
			textField.text = label;
			var labelWidth:Number = 0;
			var labelHeight:Number = 0;
			var tlm:TextLineMetrics = textField.getLineMetrics(0);
			textField.width = labelWidth = tlm.width+4;
			textField.height = labelHeight = tlm.height+4;
			width = textField.width + padding*2;
			height = textField.height + padding*2;
			buttonMode = true;
			textField.mouseEnabled = false;
		}

		protected override function createChildren():void
		{
			super.createChildren();
			if(!textField){
				textField = new UITextField();
				textField.defaultTextFormat = labelStyle;
				textField.selectable = false;
				addChild(textField);
			}
		}
		
		protected function drawBg():void
		{
			graphics.clear();
			graphics.beginFill(0x333333,1);
			graphics.drawRoundRect(0,0,width,height,cornerRadius,cornerRadius);
			graphics.endFill();
		}

		protected override function measure():void
		{
			super.measure();
		}

		protected override function updateDisplayList():void
		{
			super.updateDisplayList();
			drawBg();
			textField.x = width - textField.width >> 1;
			textField.y = height - textField.height >> 1;
		}

		
	}
}