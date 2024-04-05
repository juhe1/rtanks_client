package var_5
{
   import flash.text.TextFormat;
   
   public class name_269
   {
      
      private static var textFormat:TextFormat = new TextFormat("Tahoma");
      
      private static var embedFonts:Boolean = false;
       
      
      public function name_269()
      {
         super();
      }
      
      public static function method_775(param1:int) : TextFormat
      {
         return new TextFormat(textFormat.font,param1,textFormat.color,textFormat.bold,textFormat.italic,textFormat.underline,textFormat.url,textFormat.target,textFormat.align,textFormat.leftMargin,textFormat.rightMargin,textFormat.indent,textFormat.leading);
      }
      
      public static function method_774() : Boolean
      {
         return embedFonts;
      }
      
      public static function setTextFormat(param1:TextFormat, param2:Boolean) : void
      {
         name_269.textFormat = param1;
         name_269.embedFonts = param2;
      }
   }
}
