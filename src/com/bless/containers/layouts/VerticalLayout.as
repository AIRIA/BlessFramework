//////////////////////////////////////////////
//
//BlessFramework
//Copyright 2012 
//Author:BlessMan QQ:506896470 
//E-mail:chaibingcheng0305@163.com
//
//////////////////////////////////////////////
package com.bless.containers.layouts
{
	import com.bless.core.Container;
	import com.bless.core.UIComponent;
	
	/**
	 * <p>垂直布局管理器</p>
	 * <p>在measure方法中编写布局逻辑</p>
	 *
	 */
	public class VerticalLayout extends BaseLayout
	{
		public function VerticalLayout(target:Container)
		{
			super(target);
		}
		
		override public function measure():void{
			var numChildren:Number = target.numChildren;
			for(var i:int=0;i<numChildren;i++){
				var child:UIComponent = target.getChildAt(i) as UIComponent;
				if(child&&!isNaN(child.explicitOrMeasuredHeight)){
					if(i==0){
						//第一个组件只有padding填充 后面的组件是当前的高度加上行间距
						child.y = target.padding;
					}else{
						child.y = target.contentHeight+target.verticalGap;
					}
					child.x = target.padding;
					target.contentHeight = child.y + child.explicitOrMeasuredHeight;
				}
				//获得垂直布局容器的内容宽度
				if(target.childMaxWidth<child.explicitOrMeasuredWidth){
					target.childMaxWidth = child.explicitOrMeasuredWidth + target.padding*2;
				}
			}
			//给内容的宽度加上padding
			target.contentHeight += target.padding;
		}
		
		override public function layout():void{
			
		}
		
	}
}