(ns uathoibrean.factorio.importer
  (:require [clojure.java.io :as io]
            [uathoibrean.support.constants :as const]))

(declare get-recipe-files)

(defn get-file-or-recurse [path]
  (let [file (io/file path)]
    (println (.listFiles file))
    (cond (.isDirectory file) (get-recipe-files (.listFiles file))
          :else file)))

(defn get-recipe-files
  ([] nil)
  ([path] (cond
            (string? path) (get-file-or-recurse path)
            (list? path) (get-recipe-files (first path) (rest path))
            :else nil))
  ([path & rst] (cons (get-recipe-files path) (get-recipe-files rst))))

(get-file-or-recurse (const/factorio-base-path))
