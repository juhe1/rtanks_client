package package_484
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.device.DevicesIcons;
   import alternativa.tanks.model.GarageModel;
   import alternativa.tanks.model.name_324;
   import alternativa.tanks.model.name_381;
   import base.class_122;
   import controls.base.name_1890;
   import controls.labels.name_2551;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.name_1139;
   import package_13.Long;
   import package_340.name_1635;
   import package_379.name_3744;
   import package_471.class_209;
   import package_471.name_3346;
   import package_492.name_3743;
   import package_54.name_102;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_3685 extends class_122 implements class_209
   {
      
      private static const const_2940:int = 64;
      
      private static const const_2939:int = 200;
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().name_6(ResourceRegistry) as ResourceRegistry;
       
      
      private var icon:Bitmap;
      
      public var var_643:name_1890;
      
      public var var_3753:name_1890;
      
      private var border:name_3743;
      
      private var var_3754:ImageResource;
      
      private var var_3755:name_3346;
      
      public var skin:name_70;
      
      public var item:name_70;
      
      public function name_3685(param1:name_70, param2:name_70)
      {
         var _loc5_:name_2551 = null;
         this.icon = new Bitmap();
         this.var_643 = new name_1890();
         this.var_3753 = new name_1890();
         super();
         var _loc3_:name_324 = GarageModel(OSGi.getInstance().name_6(name_381)).getObjectItemParams(param2);
         this.item = param1;
         this.skin = param2;
         this.icon.x = 30;
         this.icon.y = 20;
         if(param2 == param1)
         {
            this.icon.bitmapData = DevicesIcons.name_3682;
         }
         else
         {
            this.var_3754 = ImageResource(resourceRegistry.getResource(_loc3_.previewId));
            if(this.var_3754.isLazy && !this.var_3754.isLoaded)
            {
               this.var_3755 = new name_3346(this);
               if(!this.var_3754.isLoading)
               {
                  this.var_3754.loadLazyResource(this.var_3755);
               }
               else
               {
                  this.var_3754.addLazyListener(this.var_3755);
               }
            }
            else
            {
               this.icon.bitmapData = this.var_3754.data;
            }
         }
         addChild(this.icon);
         var _loc4_:name_2551 = new name_2551();
         _loc4_.size = 18;
         _loc4_.color = name_1139.name_2195;
         _loc4_.width = 200;
         _loc4_.wordWrap = true;
         _loc4_.x = this.icon.x + 64 + 10;
         _loc4_.y = 20;
         _loc4_.text = param2 == param1 ? String(localeService.getText(name_390.const_1411)) : _loc3_.name;
         addChild(_loc4_);
         _loc5_ = new name_2551();
         _loc5_.color = name_1139.name_2195;
         _loc5_.multiline = true;
         _loc5_.wordWrap = true;
         _loc5_.width = 200;
         _loc5_.x = _loc4_.x;
         _loc5_.y = _loc4_.y + _loc4_.height + 8;
         _loc5_.text = param1 == param2 ? String(localeService.getText(name_390.const_819)) : _loc3_.description;
         addChild(_loc5_);
         this.border = new name_3743(_loc5_.y + _loc5_.height + 20,true);
         this.border.x = 10;
         addChild(this.border);
         this.var_3753.x = this.border.x + this.border.width - this.var_3753.width - 20;
         this.var_3753.y = this.border.height - this.var_3753.height >> 1;
         addChild(this.var_3753);
         this.var_643.name_1342(localeService.getText(name_390.const_1304));
         this.var_643.x = this.var_3753.x;
         this.var_643.y = this.var_3753.y;
         this.var_3753.addEventListener(MouseEvent.CLICK,this.method_3353);
      }
      
      private function method_3354(param1:MouseEvent) : void
      {
         var _loc2_:name_70 = this.item.space.getObject(Long.getLong(214,886180036));
         dispatchEvent(new Event(name_3744.CLOSE));
      }
      
      private function method_3353(param1:MouseEvent) : void
      {
         name_1635(this.item.name_176(name_1635)).mount(this.skin);
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function update() : void
      {
         var _loc2_:Boolean = name_1635(this.item.name_176(name_1635)).getMountedSkin() == this.skin;
         this.var_643.visible = false;
         this.var_3753.visible = true;
         this.var_3753.enabled = !_loc2_;
         this.var_3753.label = localeService.getText(_loc2_ ? name_390.const_1181 : name_390.name_1367);
      }
      
      public function destroy() : void
      {
         if(this.var_3755 != null)
         {
            this.var_3754.removeLazyListener(this.var_3755);
         }
      }
      
      public function method_3046(param1:ImageResource) : void
      {
         this.icon.bitmapData = param1.data;
      }
   }
}
