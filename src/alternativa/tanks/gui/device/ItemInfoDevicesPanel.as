package alternativa.tanks.gui.device
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.GarageModel;
   import alternativa.tanks.model.name_324;
   import alternativa.tanks.model.name_381;
   import controls.base.name_1134;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.name_1139;
   import package_218.name_637;
   import package_340.name_1634;
   import package_340.name_1635;
   import package_379.class_123;
   import package_432.ItemsCategoryViewGrid;
   import package_471.class_209;
   import package_471.name_3346;
   import package_484.ItemSkinsWindow;
   import package_53.name_94;
   import package_54.name_102;
   import package_75.name_274;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ItemInfoDevicesPanel extends Sprite implements class_209
   {
      
      private static const const_2787:int = 3;
      
      private static const const_2786:int = 0;
      
      private static const const_2784:int = 1;
      
      private static const const_2785:int = 2;
      
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().name_6(ResourceRegistry) as ResourceRegistry;
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().name_6(name_94) as name_94;
      
      public static var battleInfoService:name_274 = OSGi.getInstance().name_6(name_274) as name_274;
      
      public static var blurService:name_637 = OSGi.getInstance().name_6(name_637) as name_637;
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
       
      
      private var var_3612:Vector.<name_3545>;
      
      private var var_3615:Vector.<ImageResource>;
      
      private var var_3613:Vector.<name_3346>;
      
      private var var_3614:name_70;
      
      private var panel:ItemsCategoryViewGrid;
      
      private var skinsWindow:class_123 = null;
      
      public function ItemInfoDevicesPanel()
      {
         var _loc1_:name_3545 = null;
         this.var_3612 = new Vector.<name_3545>(3,true);
         this.var_3615 = new Vector.<ImageResource>(3,true);
         this.var_3613 = new Vector.<name_3346>(3,true);
         this.panel = new ItemsCategoryViewGrid();
         super();
         var _loc2_:name_1134 = new name_1134();
         _loc2_.text = localeService.getText(name_390.const_1407);
         _loc2_.size = 18;
         _loc2_.color = name_1139.name_2195;
         _loc2_.x = -3;
         addChild(_loc2_);
         this.panel.y = _loc2_.y + _loc2_.height + 4;
         this.panel.columnCount = 3;
         this.panel.name_2617 = 8;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_3612.length)
         {
            _loc1_ = new name_3545(_loc3_);
            this.var_3612[_loc3_] = _loc1_;
            this.panel.addItem(_loc1_);
            _loc3_++;
         }
         addChild(this.panel);
         this.panel.render();
      }
      
      public function init(param1:name_70) : void
      {
         this.var_3614 = param1;
         this.method_902();
      }
      
      private function method_902() : void
      {
         this.method_91();
         var _loc1_:int = 0;
         while(_loc1_ < this.var_3612.length)
         {
            this.method_3231(_loc1_);
            _loc1_++;
         }
      }
      
      private function method_3231(param1:int) : void
      {
         this.removeLazyListener(param1);
         var _loc2_:name_3545 = this.var_3612[param1];
         _loc2_.visible = false;
         _loc2_.name_3549();
         switch(param1)
         {
            case 0:
               _loc2_.visible = true;
               if(name_1634(this.var_3614.name_176(name_1634)).getSkins().length > 0)
               {
                  _loc2_.name_3548();
                  _loc2_.addEventListener(MouseEvent.CLICK,this.method_3229);
                  this.method_3230(0);
                  break;
               }
         }
      }
      
      private function method_3230(param1:int) : void
      {
         var _loc2_:name_324 = null;
         var _loc3_:ImageResource = null;
         var _loc4_:name_70 = null;
         if(param1 == 0)
         {
            _loc4_ = name_1635(this.var_3614.name_176(name_1635)).getMountedSkin();
            _loc2_ = GarageModel(OSGi.getInstance().name_6(name_381)).getObjectItemParams(_loc4_);
            _loc3_ = this.var_3614 == _loc4_ ? null : ImageResource(resourceRegistry.getResource(_loc2_.previewId));
         }
         else if(param1 == 2)
         {
         }
         if(_loc3_ == null)
         {
            this.var_3612[param1].name_3547();
            return;
         }
         if(_loc3_.isLazy && !_loc3_.isLoaded)
         {
            this.var_3615[param1] = _loc3_;
            this.var_3613[param1] = new name_3346(this);
            if(!_loc3_.isLoading)
            {
               _loc3_.loadLazyResource(this.var_3613[param1]);
            }
            else
            {
               _loc3_.addLazyListener(this.var_3613[param1]);
            }
         }
         else
         {
            this.var_3612[param1].name_3546(_loc3_.data);
         }
      }
      
      private function method_3229(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         var grade:int = this.var_3612.indexOf(event.target);
         if(grade == 0)
         {
            this.skinsWindow = new ItemSkinsWindow(this.var_3614,function():void
            {
               skinsWindow.removeEventListener(Event.CHANGE,onDeviceChanged);
               skinsWindow = null;
            });
            this.skinsWindow.addEventListener(Event.CHANGE,this.onDeviceChanged);
            return;
         }
      }
      
      public function destroy() : void
      {
         this.method_91();
         this.var_3612 = null;
         this.var_3615 = null;
         this.var_3613 = null;
         this.var_3614 = null;
         if(this.skinsWindow is ItemSkinsWindow)
         {
            (this.skinsWindow as ItemSkinsWindow).close();
         }
      }
      
      private function method_91() : void
      {
         var _loc1_:name_3545 = null;
         for each(_loc1_ in this.var_3612)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this.method_3229);
         }
         this.method_3232();
      }
      
      private function method_3232() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.var_3612.length)
         {
            this.removeLazyListener(_loc1_);
            _loc1_++;
         }
      }
      
      private function removeLazyListener(param1:int) : void
      {
         if(this.var_3615[param1] != null && this.var_3613[param1] != null)
         {
            this.var_3615[param1].removeLazyListener(this.var_3613[param1]);
         }
      }
      
      private function onDeviceChanged(param1:Event) : void
      {
         this.method_902();
      }
      
      public function method_3046(param1:ImageResource) : void
      {
         var _loc2_:int = this.var_3615.indexOf(param1);
         this.var_3612[_loc2_].name_3546(param1.data);
      }
   }
}
