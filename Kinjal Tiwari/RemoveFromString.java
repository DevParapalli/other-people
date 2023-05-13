public class RemoveFromString {
    public static String replaceLast(String string, String toReplace, String replacement) {
        int pos = string.lastIndexOf(toReplace);
        if (pos > -1) {
            return string.substring(0, pos)
                 + replacement
                 + string.substring(pos + toReplace.length());
        } else {
            return string;
        }
    }
    public static void main(String[] args) {
        String s = "Kinjal Tiwari";
        System.out.println(RemoveFromString.replaceLast(s, "i", ""));
    }
}