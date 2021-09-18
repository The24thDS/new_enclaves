const versionRegExp = /NE_VERSION: "New Enclaves v(?<version>.*)"/;

module.exports.readVersion = (contents) => {
  return contents.match(versionRegExp).groups.version;
}

module.exports.writeVersion = (contents, version) => {
  return contents.replace(versionRegExp, `NE_VERSION: "New Enclaves v${version}"`);
}