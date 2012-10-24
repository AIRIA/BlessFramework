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
	import com.bless.core.Application;
	import com.bless.core.ApplicationGlobals;
	import com.bless.core.UIComponent;
	import com.bless.events.ImageEvent;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	/**
	 * Image 控件允许您在运行时导入 JPEG、PNG、GIF 
	 *
	 */
	public class Image extends UIComponent
	{
		private var imageLoader:Loader;
		private var imageUrlReq:URLRequest;
		private var _source:String;
		private var autoLoad:Boolean = true;
		
		public function Image()
		{
			super();
			trace("new image");
		}
		
		/**
		 * 设置图片的url地址 
		 * @param value
		 * 
		 */		
		public function set source(value:String):void
		{
			if(!imageUrlReq){
				imageUrlReq = new URLRequest();
				imageLoader = new Loader();
			}
			if(_source!=value){
				_source = value;
				imageUrlReq.url = value;
				imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,completeHandler);
				imageLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progressHandler);
				imageLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
				if(imageLoader.content){
					if(contains(imageLoader.content)){
						removeChild(imageLoader.content);
					}
					createChildren();
				}
			}
		}
		/**
		 * 释放图片资源 
		 * 
		 */		
		public function dispose():void
		{
			imageLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,completeHandler);
			imageLoader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,progressHandler);
			imageLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
			imageLoader.unloadAndStop(true);
			imageLoader = null;
			imageUrlReq = null;
		}
		
		protected function ioErrorHandler(event:IOErrorEvent):void
		{
			dispatchEvent(new ImageEvent(ImageEvent.IO_ERROR,this));
		}
		
		protected function progressHandler(event:ProgressEvent):void
		{
			dispatchEvent(new ImageEvent(ImageEvent.PROGRESS_EVENT,this));
		}
		
		protected function completeHandler(event:Event):void
		{
			addChild(imageLoader.content);
			measuredWidth = imageLoader.content.width;
			measuredHeight = imageLoader.content.height;
			imageLoader.content.width = explicitWidth;
			imageLoader.content.height = explicitHeight;
			invalidateSize();
			updateDisplayList();
			dispatchEvent(new ImageEvent(ImageEvent.COMPLETE,this));
		}
		
		override protected function createChildren():void{
			if(autoLoad){
				load();
			}
		}
		
		override protected function commitProperties():void
		{
			
		}
		
		override protected function measure():void
		{
			
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
		}
		
		/**
		 * 在使用延迟加载的时候 由用户调用 否则不需要 
		 * 
		 */		
		public function load():void
		{
			imageLoader.load(imageUrlReq);
		}
	}
}