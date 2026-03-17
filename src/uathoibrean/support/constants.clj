(ns uathoibrean.support.constants)

(defn factorio-base-path []
  (let [os (System/getProperty "os.name")]
    (cond
      (= os "Linux") (format "%s%s"
                             (System/getProperty "user.home")
                             ".local/share/Steam/steamapps/common/Factorio/data")
      :else nil)))
