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
	import com.bless.containers.layouts.HorizontalLayout;
	import com.bless.containers.layouts.VerticalLayout;
	import com.bless.managers.OverlayRenderManager;
	import com.bless.managers.ValidateManager;
	
	import flash.display.DisplayObject;

	/**
	 * 所有组件的基类
	 *
	 */
	public class UIComponent extends BlessSprite
	{
		
		private var _explicitWidth:Number;
		private var _explicitHeight:Number;
		private var _width:Number;
		private var _height:Number;
		private var oldWidth:Number = 0;
		private var oldHeight:Number = 0;
		private var oldScaleX:Number = 1.0;
		private var oldScaleY:Number = 1.0;
		private var _horizontalCenter:Number;
		private var _verticalCenter:Number;
		private var _measuredWidth:Number=0;
		private var _measuredHeight:Number=0;
		private var _measuredMinWidth:Number = 0;
		private var _measuredMaxWidth:Number = 0;
		private var _measuredMaxHeight:Number = 0;
		private var _measuredMinHeight:Number = 0;
		private var _nestLevel:int = 0;
		private var _owner:DisplayObject;
		private var initialized:Boolean = false;
		public var mainApp :Application;
		
		
		
		
		
		/**
		 * 失效的标识  false代表没有失效 true代表失效了 只有失效之后才可以进行更新操作
		 */		
		public var invalidateDisplayListFlag:Boolean = false;
		/**
		 * 失效的标识  false代表没有失效 true代表失效了 只有失效之后才可以进行更新操作
		 */	
		public var invalidatePropertiesFlag:Boolean = false;
		/**
		 * 失效的标识  false代表没有失效 true代表失效了 只有失效之后才可以进行更新操作
		 */	
		public var invalidateSizeFlag:Boolean = false;
		
		/**
		 * <p>明确设置对象的高度 该属性的好处是 可以保存用户设置width后的宽度</p>
		 * <p>因为在该组件没有子级列表的时候 即使设置了width属性  width依旧是0 而explicitXXX可以保存明确设置的大小</p>
		 * @return 
		 * 
		 */			
		public function get explicitWidth():Number
		{
			return _explicitWidth;
		}
		
		public function set explicitWidth(value:Number):void
		{
			_explicitWidth = value;
		}
		/**
		 * <p>明确设置对象的高度 该属性的好处是 可以保存用户设置height后的宽度</p>
		 * <p>因为在该组件没有子级列表的时候 即使设置了height属性  width依旧是0 而explicitXXX可以保存明确设置的大小</p>
		 * @return 
		 * 
		 */		
		public function get explicitHeight():Number
		{
			return _explicitHeight;
		}
		
		public function set explicitHeight(value:Number):void
		{
			_explicitHeight = value;
		}
		/**
		 * 获取一个显示对象 的实际像素宽度 
		 * @return 
		 * 
		 */		
		public function get measuredWidth():Number{
			return _measuredWidth;
		}
		
		public function set measuredHeight(value:Number):void
		{
			_measuredHeight = value;	
		}
		
		public function get measuredMinWidth():Number
		{
			return _measuredMinWidth;
		}
		
		public function set measuredMinWidth(value:Number):void
		{
			_measuredMinWidth = value;
		}
		
		public function get measuredMaxWidth():Number
		{
			return _measuredMaxWidth
		}
		
		public function set measuredMaxWidth(value:Number):void
		{
			_measuredMaxWidth = value;
		}
		
		public function get measuredMaxHeight():Number
		{
			return _measuredMaxHeight;
		}
		
		public function get measuredMinHeight():Number
		{
			return _measuredMinHeight;
		}
		
		public function set measruedMaxHeight(value:Number):void
		{
			_measuredMaxHeight = value;
		}
		
		public function set measruedMinHeight(value:Number):void
		{
			_measuredMinHeight = value;
		}
		
		/**
		 * 获取一个显示对象 的实际像素高度
		 * @return 
		 * 
		 */	
		public function get measuredHeight():Number
		{
			return _measuredHeight;	
		}
		
		public function set measuredWidth(value:Number):void
		{
			if(_measuredWidth!=value){
				_measuredWidth = value;
			}
		}
		
		/**
		 * 显示对象在父级显示列表中距离水平中心的距离  
		 * @return 
		 * 
		 */		
		public function get horizontalCenter():Number
		{
			return _horizontalCenter;
		}
		
		override public function set x(value:Number):void
		{
			if(super.x == value){
				return;
			}
			super.x = value;
			invalidateProperties();
		}
		/**
		 * 组件在父组件显示坐标中的X轴坐标 
		 * @return 
		 * 
		 */		
		override public function get x():Number{
			return super.x;
		}
		
		override public function set y(value:Number):void
		{
			if(super.y == value){
				return;
			}
			super.y = value;
			invalidateProperties();
		}
		/**
		 * 组件在父组件显示坐标中的Y轴坐标 
		 * @return 
		 * 
		 */	
		override public function get y():Number
		{
			return super.y;
		}
		
		public function set horizontalCenter(value:Number):void
		{
			if(_horizontalCenter!=value){
				_horizontalCenter = value;
				invalidateProperties();
				invalidateDisplayList();
			}
		}
		
		/**
		 * 显示对象中心距离父级容器垂直中心的距离 
		 * @return 
		 * 
		 */		
		public function get verticalCenter():Number
		{
			return _verticalCenter;
		}
		public function set verticalCenter(value:Number):void
		{
			if(_verticalCenter!=value){
				_verticalCenter = value;
				invalidateProperties();
				invalidateDisplayList();
			}
		}
		/**
		 * 快速获取显示对象的有效尺寸 
		 * @return 
		 * 
		 */
		public function get explicitOrMeasuredWidth():Number{
			return isNaN(explicitWidth)?measuredWidth:explicitWidth;
		}
		
		/**
		 * 快速获取显示对象的有效尺寸 
		 * @return 
		 * 
		 */
		public function get explicitOrMeasuredHeight():Number{
			return isNaN(explicitHeight)?measuredHeight:explicitHeight;
		}
		
		/**
		 * 组件的高度 
		 * @return 
		 * 
		 */		
		override public function get height():Number{
			return explicitOrMeasuredHeight;
		}
		
		override public function set height(value:Number):void{
			if(explicitHeight!=value){
				explicitHeight = value;
			}
			if(_height!=value){
				_height = value;
			}
		}
		
		override public function set width(value:Number):void{
			if(explicitWidth!=value){
				explicitWidth = value;
			}
			if(_width!=value){
				_width = value;
			}
		}
		/**
		 * 组件的宽度 
		 * @return 
		 * 
		 */		
		override public function get width():Number{
			return explicitOrMeasuredWidth;
		}
		
		/**
		 * 获取显示对象在应用程序中所处的嵌套层级关系 
		 * @return 
		 * 
		 */		
		public function get nestLevel():int
		{
			return _nestLevel;
		}
		
		public function set nestLevel(value:int):void
		{
			if(value>1&&_nestLevel!=value){
				_nestLevel = value;
				//更新自身嵌套层级关系的同时要更新子项列表的层级关系
				for(var i:int=0;i<numChildren;i++){
					var child:UIComponent = getChildAt(i) as UIComponent;
					//判断是不是UIComponnet 如果是的话就更新 这个相当于使用了递归的方式
					if(child){
						child.nestLevel = value+1;
					}
				}
			}
		}
		
		/**
		 * 获取对象所在的UIComponent容器 
		 * @return 
		 * 
		 */		
		public function get owner():DisplayObject{
			return _owner?_owner:parent;
		}
		
		public function set owner(value:DisplayObject):void
		{
			_owner = value;
		}
		
		override public function addChild(child:DisplayObject):DisplayObject{
			addingChild(child);
			super.addChild(child);
			childAdded(child);
			return child;
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject{
			addingChild(child);
			super.addChildAt(child,index);
			childAdded(child);
			return child;
		}
		
		/**
		 * 在添加子项之前 处理一些数据 
		 * @param child
		 * 
		 */		
		private function addingChild(child:DisplayObject):void
		{
			var uiComp:UIComponent = child as UIComponent;
			if(uiComp){
				//添加到显示列表之前要更新显示列表的嵌套级别
				uiComp.nestLevel = nestLevel + 1;
				uiComp.owner = this;
			}
		}
		
		/**
		 * 组件被添加到显示列表之后   开始进行组件内部的初始化操作 
		 * @param child
		 * 
		 */		
		private function childAdded(child:DisplayObject):void
		{
			if(child is UIComponent&&initialized==false){
				UIComponent(child).initialize();
				initialized = false;
			}
		}
		
		/**
		 * 组件被添加到显示列表之后   开始进行组件内部的初始化操作 
		 * 
		 */		
		public function initialize():void
		{
			createChildren();
			childrenCreated();
			OverlayRenderManager.getInstance().renderLater(this);
		}
		/**
		 * 
		 * 
		 */		
		protected function childrenCreated():void
		{
			trace("created");
			
			invalidateProperties();
			invalidateSize();
			invalidateDisplayList();
		}
		/**
		 * 是属性失效并提交最新的属性 
		 * 
		 */		
		public function invalidateProperties():void
		{
			if(!mainApp){
				mainApp = ApplicationGlobals.application;
			}
			//如果没有失效 就执行失效的方法 
			if(!invalidatePropertiesFlag){
				ValidateManager.getInstance().invalidateProperties(this);
			}
		}
		/**
		 * 是属性失效并提交最新的尺寸信息 
		 * 
		 */	
		public function invalidateSize():void{
			if(!invalidateSizeFlag){
				ValidateManager.getInstance().invalidateSize(this);
			}
		}
		/**
		 * 是属性失效并使用最新的属性和尺寸更新显示列表 
		 * 
		 */	
		public function invalidateDisplayList():void
		{
			//如果还没有失效  就调用失效方法
			if(!invalidateDisplayListFlag){
				ValidateManager.getInstance().invalidateDisplayList(this);
			}
		}
		
		/**
		 *  
		 * 提交属性
		 */		
		public function validateProperties():void
		{
			trace(this+"validateProperties");
			if(invalidatePropertiesFlag){
				invalidatePropertiesFlag = false;
				commitProperties();
			}
		}
		
		/**
		 * <p>测量尺寸</p> 
		 * <p>如果该组件所在的父组件是容器类的话 会级联调用父级的 invalidateSize invalidateDisplayList方法 更新尺寸和布局</p>
		 */		
		public function validateSize():void
		{
			trace(this+"validateSize");
			if(invalidateSizeFlag){
				invalidateSizeFlag = false;
				measure();
				var changed:Boolean = measureSize();
				if(changed){
					var p:Container = parent as Container;
					if(p){
						p.invalidateSize();
						p.invalidateDisplayList();
					}
				}
			}
		}
		
		/**
		 * 获取尺寸 判断是不是发生了变化 如果变化了会抛出Resize事件 
		 * @return 
		 * 
		 */		
		public function measureSize():Boolean
		{
			var changed:Boolean = false;
			if(width!=explicitWidth||height!=explicitHeight){
				changed = true;
			}
			return changed;
		}
		
		/**
		 * 生效的时候 调用此方法  
		 * 
		 */		
		public function validateDisplayList():void
		{
			trace(this+"validateDisplayList");
			//更新过后 把失效标识重新赋值为false 标识为未失效
			if(invalidateDisplayListFlag){
				invalidateDisplayListFlag = false;
				updateDisplayList();
			}
		}
		/**
		 * 设置组件的实际尺寸大小 
		 * @param w
		 * @param h
		 * 
		 */		
		public function setActualSize(w:Number,h:Number):void{
			var sizeChanged:Boolean = false;
			if(width!=w){
				_width = w;
				sizeChanged = true;
			}
			if(height!=h){
				_height = h;
				sizeChanged = true;
			}
			//如果尺寸改变了 就刷新显示列表
			if(sizeChanged){
				invalidateDisplayList();
			}
		}
		
		//--------------------------------------------------
		// should be override service method
		//--------------------------------------------------
		
		/**
		 * 更新显示列表  次方法会在添加到先是舞台上 渲染的时候调用
		 * 
		 */		
		protected function updateDisplayList():void
		{
			if(!disabledHVCenter()){
				//只有在绝对布局的容器中 此属性才有用
				if(!isNaN(horizontalCenter)){
					if(parent&&parent!=mainApp){
						x = (parent.width - explicitOrMeasuredWidth >> 1) + horizontalCenter;
					}else{
						x = (mainApp.stage.stageWidth - explicitOrMeasuredWidth >> 1) + horizontalCenter;
					}
					
				}
				if(!isNaN(verticalCenter)){
					if(parent&&parent!=mainApp){
						y = (parent.height - explicitOrMeasuredHeight >> 1) + verticalCenter;
					}else{
						y = (mainApp.stage.stageHeight - explicitOrMeasuredHeight >> 1) + verticalCenter;
					}
				}
			}
			if(stage){
				setActualSize(explicitOrMeasuredWidth,explicitOrMeasuredHeight)
			}
		}
		/**
		 * 禁用horizontalCenter和verticalCenter属性 
		 * 
		 */		
		public function disabledHVCenter():Boolean
		{
			var parent:Container = parent as Container;
			if(parent){
				var parentLayout:BaseLayout = parent.layout;
				if(parentLayout is HorizontalLayout || parentLayout is VerticalLayout){
					return true;
				}
			}
			return false;
		}
		
		/**
		 * <p>提交属性值 由validateProperties调用</p> 
		 * <p>在重写组件的时候 可以重写此方法</p>
		 * 
		 */		
		protected function commitProperties():void
		{
			
		}
		
		/**
		 * 子类需要重写该方法 来 
		 * 
		 */		
		protected function createChildren():void
		{
			
		}
		
		/**
		 * 用来测量尺寸 在扩展组件中调用 
		 * 
		 */		
		protected function measure():void
		{
			
		}
		/**
		 * 构造方法 
		 * 
		 */		
		public function UIComponent()
		{
			super();
			_width = super.width;
			_height = super.height;
		}
	}
}