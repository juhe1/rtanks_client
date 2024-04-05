package package_159
{
   import flash.filters.BitmapFilter;
   import package_371.BCSHFilter;
   
   public class name_1600
   {
       
      
      private var brightness:Number;
      
      private var contrast:Number;
      
      private var saturation:Number;
      
      private var hue:Number;
      
      public function name_1600(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.brightness = param1;
         this.contrast = param2;
         this.saturation = param3;
         this.hue = param4;
      }
      
      public function name_1776() : BitmapFilter
      {
         return BCSHFilter.name_1776(this.brightness,this.contrast,this.saturation,this.hue);
      }
   }
}
