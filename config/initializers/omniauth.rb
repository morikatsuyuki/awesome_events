Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,
            Rails.application.credentials.github[:client_id],
            Rails.application.credentials.github[:client_secret]
end

# CSRF対策
# OmniAuth.config.allowed_request_methods = [:post, :get] 
# :getを許可した場合、WARN警告がでる。
# OmniAuthは「デフォルトでPOSTリクエストのみ」を許可するようになっているが、なぜかGETでリクエストして下記の警告が出てしまう。。2025/06/19
  # WARN -- omniauth: (github)   You are using GET as an allowed request method for OmniAuth. This may leave
  # you open to CSRF attacks. As of v2.0.0, OmniAuth by default allows only POST
  # to its own routes. You should review the following resources to guide your
  # mitigation:
  # https://github.com/omniauth/omniauth/wiki/Resolving-CVE-2015-9284
  # https://github.com/omniauth/omniauth/issues/960
  # https://nvd.nist.gov/vuln/detail/CVE-2015-9284
  # https://github.com/omniauth/omniauth/pull/809
# 上記の警告は、OmniAuthがGETリクエストを許可しているため、CSRF攻撃に対して脆弱であることを示しています
# OmniAuthは「デフォルトでPOSTリクエストのみ」を許可するようになっており、GETリクエストを許可することはセキュリティ上のリスクを高めます

# OmniAuth.config.allowed_request_methods = [:post]   


# OmniAuthが受け付けるHTTPリクエストメソッドを制限する設定です。この設定が必要な理由は以下の通りです：
# 1. セキュリティ上の理由:
# デフォルトでは、OmniAuthはすべてのHTTPメソッド（GET, POST, PUT, DELETE, PATCH, OPTIONS, HEAD）を受け付けます
# しかし、認証処理では通常、GETとPOSTのみが必要です
# 他のメソッド（PUT, DELETE, PATCHなど）を許可すると、不要なリクエストを受け付けることになり、セキュリティリスクが高まります
# 2. CSRF対策:
# Railsでは、CSRF（Cross-Site Request Forgery）対策として、GETリクエスト以外のメソッドに対してCSRFトークンの検証を行います
# OmniAuthの認証フローでは、GETリクエストを使用して認証プロバイダー（GitHub）にリダイレクトし、POSTリクエストを使用して認証結果を受け取ります
# この設定により、OmniAuthはGETとPOSTのみを受け付けるようになり、CSRF対策と互換性を持つことができます
# 3. 認証フローの制限:
# OmniAuthの認証フローは、主にGETとPOSTリクエストを使用して行われます
# 他のメソッド（PUT, DELETE, PATCHなど）は認証フローでは使用されないため、許可する必要がありません
# この設定により、OmniAuthは認証フローで使用されるメソッドのみを受け付けるようになり、不要なリクエストを受け付けることを防ぎます
# 4. デバッグの容易化:
# 認証フローで使用されるメソッドを制限することで、認証フローのデバッグが容易になります
# 不要なメソッドが受け付けられると、認証フローのデバッグが困難になる可能性があります
# この設定により、認証フローのデバッグが容易になります
# 5.Railsのデフォルト設定との整合性:
# Railsのデフォルト設定では、CSRF対策としてGETリクエスト以外のメソッドに対してCSRFトークンの検証を行います
# この設定により、OmniAuthはRailsのデフォルト設定と整合性を持つことができます
# 8. コードの保守性:
# 不要なメソッドを受け付けると、コードの保守性が低下します
# 不要なメソッドを受け付けると、コードの保守性が低下します
# この設定により、コードの保守性を高めることができます
# 9. セキュリティ上の理由:
# 不要なメソッドを受け付けると、セキュリティリスクが高まります
# 例えば、PUTリクエストを受け付けると、認証フローで不要なリクエストを受け付けることになり、セキュリティリスクが高まります
# この設定により、不要なメソッドを受け付けることを防ぎ、セキュリティリスクを低減します