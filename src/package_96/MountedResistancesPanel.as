package package_96
{
   import alternativa.osgi.OSGi;
   import base.class_122;
   import controls.base.name_1134;
   import controls.name_1891;
   import forms.name_1139;
   import package_432.ItemsCategoryViewGrid;
   import package_54.name_102;
   import package_89.name_1358;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class MountedResistancesPanel extends class_122
   {
      
      public static var var_2347:name_1358 = OSGi.getInstance().name_6(name_1358) as name_1358;
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      private static const const_1939:int = 9;
      
      private static const const_1938:int = 3;
       
      
      private var background:name_1891;
      
      private var panel:ItemsCategoryViewGrid;
      
      private var var_2346:Vector.<ResistanceButton>;
      
      private var label:name_1134;
      
      public function MountedResistancesPanel()
      {
         var _loc1_:ResistanceButton = null;
         this.background = new name_1891(164,0,name_1891.name_1428);
         this.panel = new ItemsCategoryViewGrid();
         this.var_2346 = new Vector.<ResistanceButton>();
         this.label = new name_1134();
         super();
         var _loc2_:int = 0;
         while(_loc2_ < 3)
         {
            _loc1_ = new ResistanceButton(_loc2_);
            this.var_2346.push(_loc1_);
            this.panel.addItem(_loc1_);
            _loc2_++;
         }
         this.label.text = localeService.getText(name_390.const_1084);
         this.label.size = 18;
         this.label.color = name_1139.name_2195;
         this.label.y += 9 >> 1;
         this.background.addChild(this.label);
         this.panel.y = this.label.y + this.label.height + 4;
         this.panel.name_2617 = 8;
         this.background.addChild(this.panel);
         this.background.height += 9 >> 1;
         addChild(this.background);
         var_2347.method_1069(this);
      }
      
      public function resize(param1:Number) : void
      {
         this.render();
         this.background.width = param1;
         if(this.background.height == 0)
         {
            this.background.height = this.height + 9;
         }
         this.panel.x = this.background.width - this.panel.width >> 1;
         this.label.x = this.background.width - this.label.width >> 1;
      }
      
      public function isFull() : Boolean
      {
         var _loc1_:ResistanceButton = null;
         for each(_loc1_ in this.var_2346)
         {
            if(_loc1_.name_2615())
            {
               return false;
            }
         }
         return true;
      }
      
      public function name_1530() : int
      {
         var _loc1_:int = 0;
         while(_loc1_ < 3)
         {
            if(this.var_2346[_loc1_].name_2615())
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      private function render() : void
      {
         if(parent != null)
         {
            this.panel.render();
         }
      }
      
      public function method_2364(param1:name_70) : int
      {
         var _loc2_:ResistanceButton = null;
         if(param1 == null)
         {
            return -1;
         }
         for each(_loc2_ in this.var_2346)
         {
            if(_loc2_.item == param1)
            {
               return _loc2_.method_2364();
            }
         }
         return -1;
      }
      
      public function name_1529(param1:int, param2:name_70) : void
      {
         this.var_2346[param1].item = param2;
         this.var_2346[param1].name_2616(param2);
      }
      
      public function name_1527(param1:name_70) : void
      {
         var _loc2_:ResistanceButton = null;
         for each(_loc2_ in this.var_2346)
         {
            _loc2_.item = param1;
            _loc2_.name_2616(param1);
         }
      }
      
      public function name_1528(param1:name_70) : void
      {
         var _loc2_:ResistanceButton = null;
         for each(_loc2_ in this.var_2346)
         {
            if(param1 == _loc2_.item)
            {
               _loc2_.reset();
            }
         }
      }
      
      public function name_1531() : *
      {
         var _loc1_:ResistanceButton = null;
         for each(_loc1_ in this.var_2346)
         {
            if(_loc1_.name_2615())
            {
               _loc1_.disable();
            }
         }
      }
      
      public function disable() : void
      {
         var _loc1_:ResistanceButton = null;
         for each(_loc1_ in this.var_2346)
         {
            _loc1_.disable();
         }
      }
      
      public function enable() : void
      {
         var _loc1_:ResistanceButton = null;
         for each(_loc1_ in this.var_2346)
         {
            _loc1_.enable();
         }
      }
      
      public function destroy() : void
      {
         var_2347.method_1066();
      }
   }
}
