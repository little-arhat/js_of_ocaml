
opam pin add --no-action js_of_ocaml .
opam install deriving || true
opam install tyxml reactiveData cppo base64

case $(opam switch show) in
    4.03*) opam pin add lwt https://github.com/Drup/lwt.git#4.03.0-no-oasis ;;
    *) ;;
esac

opam install --deps-only js_of_ocaml
opam install --verbose js_of_ocaml

do_build_doc () {
  opam install ocp-indent cppo higlo base64
  make -C doc clean
  make -C doc doc
  make -C doc wikidoc
  cp -Rf doc/manual/files/* ${MANUAL_FILES_DIR}/
  cp -Rf doc/manual/src/* ${MANUAL_SRC_DIR}/
  cp -Rf doc/api/wiki/*.wiki ${API_DIR}/
}

do_remove () {
  opam remove --verbose js_of_ocaml
}
