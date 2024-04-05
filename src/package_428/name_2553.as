package package_428
{
   import controls.Money;
   import controls.labels.name_2551;
   import flash.display.Bitmap;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import package_394.CrystalIcon;
   
   public class name_2553 extends Sprite
   {
       
      
      private var var_1841:Bitmap;
      
      private var label:name_2551;
      
      private var color:uint = 16777215;
      
      private var var_3142:uint = 11645361;
      
      private var line:Shape;
      
      private var var_3143:Boolean = false;
      
      public function name_2553(param1:int = 0)
      {
         this.line = new Shape();
         super();
         mouseEnabled = false;
         this.label = new name_2551();
         this.var_1841 = CrystalIcon.name_2558();
         addChild(this.label);
         addChild(this.var_1841);
         this.var_1841.y = 4;
         this.name_2559(param1);
      }
      
      public function name_1342(param1:String) : void
      {
         this.label.text = param1;
         this.var_1841.x = this.label.x + this.label.textWidth + 5;
      }
      
      public function name_2559(param1:int) : void
      {
         this.label.text = Money.name_876(param1,false);
         this.var_1841.x = this.label.x + this.label.textWidth + 5;
         this.method_2906(false);
      }
      
      public function name_2552(param1:int) : void
      {
         this.color = param1;
         if(!this.var_3143)
         {
            this.label.textColor = param1;
         }
      }
      
      public function name_2555(param1:int) : void
      {
         this.label.sharpness = param1;
      }
      
      public function name_2556(param1:int) : void
      {
         this.label.thickness = param1;
      }
      
      public function method_2907(param1:int) : void
      {
         this.var_3142 = param1;
      }
      
      public function method_2906(param1:Boolean) : void
      {
         var _loc2_:Graphics = null;
         var _loc3_:int = 0;
         this.var_3143 = param1;
         if(param1)
         {
            this.label.textColor = this.var_3142;
            _loc2_ = this.line.graphics;
            _loc2_.clear();
            _loc2_.lineStyle(1,this.var_3142);
            _loc3_ = int(this.label.y + this.label.height * 0.5) + 1;
            _loc2_.moveTo(0,_loc3_);
            _loc2_.lineTo(0 + width + 2,_loc3_);
            if(!contains(this.line))
            {
               addChild(this.line);
            }
         }
         else
         {
            this.label.textColor = this.color;
            if(contains(this.line))
            {
               removeChild(this.line);
            }
         }
      }
   }
}
