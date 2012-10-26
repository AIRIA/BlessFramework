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
		private var _padding:Number = 5;
		
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
			textField.width = labelWidth = tlm.width;
			textField.height = labelHeight = tlm.height;
			width = labelWidth + padding*2;
			height = labelHeight + padding*2;
		}

		protected override function createChildren():void
		{
			super.createChildren();
			if(!textField){
				textField = new UITextField();
				addChild(textField);
			}
		}

		protected override function measure():void
		{
			super.measure();
		}

		protected override function updateDisplayList():void
		{
			super.updateDisplayList();
		}

		
	}
}