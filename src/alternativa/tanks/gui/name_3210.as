package alternativa.tanks.gui
{
   import controls.base.LabelBase;
   import controls.labels.name_2551;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.text.TextFormatAlign;
   import package_343.ResistancesIcons;
   
   public class name_3210 extends Sprite
   {
       
      
      public var var_1747:Bitmap;
      
      private var label:LabelBase;
      
      private var var_3607:String;
      
      private const space:int = 2;
      
      private var var_3606:String;
      
      public function name_3210(param1:BitmapData, param2:String, param3:BitmapData = null)
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         super();
         if(param3 == null)
         {
            param3 = ItemInfoPanelBitmaps.name_3534;
         }
         if(param3 == ItemInfoPanelBitmaps.name_3534)
         {
            _loc4_ = _loc5_ = 1;
         }
         else
         {
            _loc4_ = _loc5_ = -4;
         }
         this.var_3607 = param2;
         var _loc6_:BitmapData = new BitmapData(param3.width,param3.height,true,0);
         _loc6_.draw(param3);
         _loc6_.draw(param1,new Matrix(1,0,0,1,_loc4_,_loc5_));
         this.var_1747 = new Bitmap(_loc6_);
         addChild(this.var_1747);
         if(param3 == ResistancesIcons.name_2360)
         {
            this.var_1747.x = 2;
         }
         this.label = new name_2551();
         this.label.size = 10;
         addChild(this.label);
         this.label.color = 59156;
         this.label.align = TextFormatAlign.CENTER;
         this.label.sharpness = -100;
         this.label.thickness = 100;
         this.method_3226();
         this.label.y = this.var_1747.height + 2;
      }
      
      public function set var_451(param1:String) : void
      {
         if(param1 != null && param1 != "null")
         {
            this.var_3606 = param1;
         }
         else
         {
            this.var_3606 = "—";
         }
         this.label.text = this.var_3606;
         this.method_3226();
      }
      
      private function method_3226() : void
      {
         if(this.var_1747.width > this.label.textWidth)
         {
            this.label.x = Math.round((this.var_1747.width - this.label.textWidth) * 0.5) - 3;
         }
         else if(this.label.textWidth > this.var_1747.width)
         {
            this.label.x = -Math.round((this.label.textWidth - this.var_1747.width) * 0.5) - 3;
         }
         else
         {
            this.label.x = -3;
         }
      }
      
      public function get method_3227() : int
      {
         return this.label.x;
      }
   }
}
