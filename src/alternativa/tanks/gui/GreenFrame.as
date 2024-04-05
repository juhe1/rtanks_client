package alternativa.tanks.gui
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import utils.name_3535;
   
   public class GreenFrame extends Sprite
   {
      
      private static const const_2821:Class = name_3671;
      
      public static const name_3566:BitmapData = new const_2821().bitmapData;
      
      public static const name_3565:BitmapData = name_3535.name_3580(name_3566);
      
      public static const name_3567:BitmapData = name_3535.name_3541(name_3566);
      
      public static const name_3571:BitmapData = name_3535.name_3580(name_3567);
      
      private static const const_2878:Class = name_3672;
      
      public static const const_2877:BitmapData = new const_2878().bitmapData;
       
      
      private var var_3702:Bitmap;
      
      private var var_3704:Bitmap;
      
      private var var_3709:Bitmap;
      
      private var var_3707:Bitmap;
      
      private var var_3708:Bitmap;
      
      private var var_3705:Bitmap;
      
      private var var_3706:Bitmap;
      
      private var var_3703:Bitmap;
      
      public function GreenFrame(param1:int, param2:int)
      {
         this.var_3702 = new Bitmap(name_3567);
         this.var_3704 = new Bitmap(const_2877);
         this.var_3709 = new Bitmap(name_3571);
         this.var_3707 = new Bitmap(const_2877);
         this.var_3708 = new Bitmap(const_2877);
         this.var_3705 = new Bitmap(name_3565);
         this.var_3706 = new Bitmap(const_2877);
         this.var_3703 = new Bitmap(name_3566);
         super();
         addChild(this.var_3703);
         addChild(this.var_3702);
         this.name_1152(param1);
         this.var_3704.x = this.var_3703.x + this.var_3703.width;
         addChild(this.var_3704);
         this.var_3705.x = this.var_3703.x;
         addChild(this.var_3705);
         this.name_1142(param2);
         addChild(this.var_3709);
         this.var_3707.x = this.var_3704.x;
         addChild(this.var_3707);
         this.var_3706.x = this.var_3703.x;
         this.var_3706.y = this.var_3703.height;
         addChild(this.var_3706);
         this.var_3708.y = this.var_3706.y;
         addChild(this.var_3708);
      }
      
      public function name_1152(param1:int) : void
      {
         this.var_3702.x = param1 - this.var_3702.width;
         this.var_3709.x = this.var_3702.x;
         this.var_3704.width = this.var_3702.x - this.var_3704.x;
         this.var_3707.width = this.var_3704.width;
         this.var_3708.x = this.var_3702.x + this.var_3702.width - this.var_3708.width;
      }
      
      public function name_1142(param1:int) : void
      {
         this.var_3705.y = param1;
         this.var_3709.y = this.var_3705.y;
         this.var_3706.height = this.var_3705.y - this.var_3703.height;
         this.var_3708.height = this.var_3706.height;
         this.var_3707.y = this.var_3705.y + this.var_3709.height - this.var_3707.height;
      }
   }
}
