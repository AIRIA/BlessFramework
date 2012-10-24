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
	 *
	 * <p>水平布局类<p>
	 * <p>在measure方法中 编写布局的逻辑代码</p>
	 */
	public class HorizontalLayout extends BaseLayout
	{
		public function HorizontalLayout(target:Container)
		{
			super(target);
		}
		
		override public function measure():void
		{
			var numChildren:int = target.numChildren;
			for(var i:int=0;i<numChildren;i++){
				var child:UIComponent;
				if(target.getChildAt(i) is UIComponent){
					child = UIComponent(target.getChildAt(i))
					//如果组件当前还没有加载出来 尺寸为0的时候 就不进行后续计算操作
					if(!child.explicitOrMeasuredHeight){
						return;
					}
					if(i==0){
						child.x = target.padding;
					}else{
						child.x = target.contentWidth + target.horizontalGap;
					}
					child.y = target.padding;
					target.contentWidth = child.x + child.explicitOrMeasuredWidth;
				}
				//在此处获取本容器的高度 以子项中 高度最高的为准
				if(target.childMaxHeight<child.explicitOrMeasuredHeight){
					target.childMaxHeight = child.explicitOrMeasuredHeight+target.padding*2;
				}
			}
			target.contentWidth += target.padding;
		}
		
		override public function layout():void
		{
			
		}
	}
}