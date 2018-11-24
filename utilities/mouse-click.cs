
[DllImport("user32.dll",CharSet=CharSet.Auto,CallingConvention=CallingConvention.StdCall)] 
public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
