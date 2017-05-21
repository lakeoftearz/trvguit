# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server "volse.anduin.net", user: "trvguit", roles: %w{app db web}
