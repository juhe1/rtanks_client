package package_382
{
   import alternativa.osgi.OSGi;
   import base.class_122;
   import controls.Label;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import forms.name_1139;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ChallengesProgressView extends class_122
   {
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      private static const const_2807:Class = name_3561;
      
      private static const const_2803:BitmapData = new const_2807().bitmapData;
      
      private static const const_2805:Class = name_3559;
      
      private static const const_2804:BitmapData = new const_2805().bitmapData;
      
      private static const const_2806:Class = name_3560;
      
      private static const const_2808:BitmapData = new const_2806().bitmapData;
       
      
      private var point:Point;
      
      private var var_3629:Bitmap;
      
      private var label:*;
      
      public function ChallengesProgressView()
      {
         var _loc1_:Bitmap = null;
         this.point = new Point();
         this.var_3629 = new Bitmap();
         this.label = new Label();
         super();
         addChild(new Bitmap(const_2803));
         addChild(this.var_3629);
         _loc1_ = new Bitmap(const_2808);
         _loc1_.x = 5;
         _loc1_.y = 6;
         addChild(_loc1_);
         this.label.bold = true;
         this.label.color = name_1139.name_1894;
         this.label.x = _loc1_.x + _loc1_.width + 5;
         this.label.y = 3;
         addChild(this.label);
      }
      
      public function method_284(param1:int, param2:int, param3:int) : void
      {
         this.label.text = localeService.getText(name_390.const_1088) + " " + param2 + "/" + param3;
         if(param1 == 0)
         {
            this.var_3629.bitmapData = null;
            return;
         }
         if(param1 == 100)
         {
            this.var_3629.bitmapData = const_2804;
            return;
         }
         var _loc4_:Number = const_2803.width * param1 / 100;
         var _loc5_:BitmapData = new BitmapData(_loc4_,const_2803.height);
         _loc5_.copyPixels(const_2804,_loc5_.rect,this.point);
         this.var_3629.bitmapData = _loc5_;
      }
   }
}
