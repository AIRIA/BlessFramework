//////////////////////////////////////////////
//
//BlessFramework
//Copyright 2012 
//Author:BlessMan QQ:506896470 
//E-mail:chaibingcheng0305@163.com
//
//////////////////////////////////////////////
package com.bless.events
{
	import com.bless.controls.Image;
	
	import flash.events.Event;
	
	/**
	 *
	 *
	 */
	public class ImageEvent extends Event
	{
		public static const PROGRESS_EVENT:String = "progressEvent";
		public static const IO_ERROR:String = "ioError";
		public static const COMPLETE:String = "complete";
		public var dispatcher:Image;
		
		public function ImageEvent(type:String,dispatcher:Image)
		{
			super(type,false,false);
			this.dispatcher = dispatcher;
		}
	}
}