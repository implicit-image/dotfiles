{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "rassumfrassum";
  version = "0.3.3";

  src = fetchPypi {
    inherit pname version;
    hash = "";  # Get this from PyPI
  };

  # Optional: add dependencies
  propagatedBuildInputs = [
    # other python packages
  ];

  # Optional: disable tests
  doCheck = false;

  meta = with lib; {
    description = "LSP multiplexer";
    homepage = "https://pypi.org/project/${pname}/";
  };
}
