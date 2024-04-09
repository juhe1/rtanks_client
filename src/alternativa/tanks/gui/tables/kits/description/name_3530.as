package alternativa.tanks.gui.tables.kits.description
{
   import assets.name_2295;
   import controls.Money;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import forms.name_1139;
   import package_131.name_352;
   
   public class name_3530 extends Sprite
   {
       
      
      public function name_3530(param1:name_352)
      {
         super();
         var _loc2_:LabelBase = new LabelBase();
         _loc2_.textColor = name_1139.name_2012;
         _loc2_.align = TextFormatAlign.LEFT;
         _loc2_.text = param1.itemName + (param1.count <= 1 ? "" : " ×" + String(param1.count));
         _loc2_.x = name_3211.const_2768;
         addChild(_loc2_);
         var _loc3_:name_2295 = new name_2295();
         _loc3_.x = name_3211.WIDTH - _loc2_.x - _loc3_.width;
         _loc3_.y = 4;
         addChild(_loc3_);
         var _loc4_:int = param1.crystalPrice * param1.count;
         var _loc5_:LabelBase = new LabelBase();
         _loc5_.color = name_1139.name_2012;
         _loc5_.align = TextFormatAlign.RIGHT;
         _loc5_.text = Money.name_876(_loc4_,false);
         _loc5_.x = _loc3_.x - _loc5_.width - 1;
         addChild(_loc5_);
      }
   }
}
