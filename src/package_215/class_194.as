package package_215
{
   import controls.cellrenderer.name_2765;
   import controls.cellrenderer.name_2766;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.name_1919;
   
   public class class_194 extends CellRenderer
   {
       
      
      protected var item:class_147;
      
      public function class_194()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         mouseEnabled = false;
         mouseChildren = true;
         useHandCursor = false;
         buttonMode = false;
         var _loc2_:DisplayObject = new name_2766();
         var _loc3_:DisplayObject = new name_2765();
         setStyle(name_1919.const_2071,_loc2_);
         setStyle(name_1919.const_2073,_loc2_);
         setStyle(name_1919.const_2074,_loc2_);
         setStyle(name_1919.const_2078,_loc3_);
         setStyle(name_1919.const_2076,_loc3_);
         setStyle(name_1919.const_2077,_loc3_);
         addEventListener(Event.RESIZE,this.onResize,false,0,true);
         addEventListener(MouseEvent.ROLL_OVER,this.onRollOver,false,0,true);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut,false,0,true);
         addChild(this.item);
         this.onResize();
      }
      
      protected function onResize(param1:Event = null) : void
      {
         this.item.height = height;
         this.item.width = width;
         this.item.y = 1;
      }
      
      protected function onRollOut(param1:MouseEvent) : void
      {
         this.item.method_1598.visible = false;
         super.selected = false;
      }
      
      protected function onRollOver(param1:MouseEvent) : void
      {
         this.item.method_1598.method_1459();
         super.selected = true;
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = _listData.label;
         if(this.item != null)
         {
            setStyle(name_1919.const_2070,this.item);
         }
      }
   }
}
