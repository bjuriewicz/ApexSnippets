public class jsonHelper {

	/*
	* returns all the values that resides in specified path. Works also with arrays
	*/
	public static String[] getAllValuesFromPath(String jsonString, string path, Boolean toLowerCase) {
		Map<String, object> jsonMap = (Map<String, object>)JSON.deserializeUntyped(jsonString);
		String[] res = new String[] {};

		String p = path.contains('.') ? path.substringBefore('.') : path;
		String nextPath = path.contains('.') ? path.substringAfter('.') : '';
		drill(jsonMap.get(p), nextPath, res, toLowerCase);
		return res;
	}

	/*
	* recursive method for getAllValuesFromPath
	*/
	private static void drill(object o, string path, String[] res, Boolean toLowerCase) {
		String p = path.contains('.') ? path.substringBefore('.') : path;
		String next = path.contains('.') ? path.substringAfter('.') : '';

		if (o instanceof Map<String, object>) {
			Map<String, object> node = (Map<String, object>)o;
			drill(node.get(p), next, res, toLowerCase);

		} else if (o instanceof object[]) {
			for (object item : (object[])o) {
				drill(item, path, res, toLowerCase);
			}
		} else {
			String val = toLowerCase ? String.valueOf(o).toLowerCase() : String.valueOf(o);
			res.add(val);
		}
	}
}