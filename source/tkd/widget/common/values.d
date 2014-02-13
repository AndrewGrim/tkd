/**
 * Values module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.widget.common.values;

/**
 * These are common commands that apply to all widgets that have them injected.
 */
mixin template Values()
{
	import std.array;

	/**
	 * Set the values of the widget.
	 *
	 * Params:
	 *     values = The widget values.
	 */
	public void setValues(string[] values)
	{
		this._tk.eval("%s configure -values { \"%s\" }", this.id, values.join("\" \""));
	}
}