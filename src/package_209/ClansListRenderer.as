package package_209
{
   import controls.cellrenderer.name_2765;
   import controls.cellrenderer.name_2766;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import forms.name_1919;
   
   public class ClansListRenderer extends CellRenderer
   {
       
      
      private var var_2629:ClanInfoLabel;
      
      public function ClansListRenderer()
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
         this.method_2573(_data);
         var _loc2_:DisplayObject = new name_2766();
         var _loc3_:DisplayObject = new name_2765();
         setStyle(name_1919.const_2071,_loc2_);
         setStyle(name_1919.const_2073,_loc2_);
         setStyle(name_1919.const_2074,_loc2_);
         setStyle(name_1919.const_2078,_loc3_);
         setStyle(name_1919.const_2076,_loc3_);
         setStyle(name_1919.const_2077,_loc3_);
         this.var_2629.width = _width;
         addEventListener(Event.RESIZE,this.onResize,false,0,true);
         this.onResize();
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = _listData.label;
         if(this.var_2629 != null)
         {
            setStyle("icon",this.var_2629);
         }
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.var_2629.width = _width;
      }
      
      private function method_2573(param1:Object) : void
      {
         if(param1.type == name_1916.INCOMING)
         {
            this.var_2629 = new name_641(param1.id);
         }
         else
         {
            this.var_2629 = new name_2764(param1.id);
         }
         addChild(this.var_2629);
      }
      
      public function onRollOut() : void
      {
         var _loc1_:name_641 = null;
         super.selected = false;
         if(this.var_2629 is name_641)
         {
            _loc1_ = name_641(this.var_2629);
            if(_loc1_.newIndicator != null)
            {
               _loc1_.newIndicator.updateNotifications();
            }
         }
      }
      
      public function onRollOver() : void
      {
         var _loc1_:name_641 = null;
         super.selected = true;
         if(this.var_2629 is name_641)
         {
            _loc1_ = name_641(this.var_2629);
            if(_loc1_.newIndicator != null)
            {
               _loc1_.newIndicator.visible = false;
            }
         }
      }
   }
}
