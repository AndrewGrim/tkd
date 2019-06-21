/**
 * ForegroundColor module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.widget.common.foregroundcolor;

/**
 * These are common commands that apply to all widgets that have them injected.
 */
mixin template ForegroundColor()
{
	import std.string;

	/**
	 * Set the foreground color of the widget.
	 *
	 * Params:
	 *     color = The name of the color, e.g. 'black' or a hex value, e.g. '#000000'.
	 *
	 * Returns:
	 *     This widget to aid method chaining.
	 *
	 * See_Also:
	 *     $(LINK2 ../../element/color.html, tkd.element.color) for standard defined colors.
	 */
    public auto setForegroundColor(this T)(string color)
    {
        this._tk.eval("%s configure -foreground %s", this.id, color);

        return cast(T) this;
    }

	public string getForegroundColor()
	{
		this._tk.eval(format("%s cget -foreground", this.id));
		if (this._tk.getResult!(string).empty())
		{
			this._tk.eval(format("winfo foreground %s", this.id));
		}
		return this._tk.getResult!(string);
	}
}
