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
	
	import flash.text.TextField;
	
	/**
	 * 
	 * 
	 */
	public class Button extends UIComponent
	{
		private var _icon:Image;
		private var _textField:TextField;
		private var _label:String;
		
		/**
		 * 文字前的图表 
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

		public function get textField():TextField
		{
			return _textField;
		}

		public function set textField(value:TextField):void
		{
			_textField = value;
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
			_label = value;
		}

		
		public function Button()
		{
			super();
		}
		
		protected override function commitProperties():void
		{
			//TODO Auto-generated method stub
			super.commitProperties();
		}

		protected override function createChildren():void
		{
			//TODO Auto-generated method stub
			super.createChildren();
		}

		protected override function measure():void
		{
			//TODO Auto-generated method stub
			super.measure();
		}

		protected override function updateDisplayList():void
		{
			//TODO Auto-generated method stub
			super.updateDisplayList();
		}

		
	}
}