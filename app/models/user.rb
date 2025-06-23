class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: 'owner_id'
  
  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider] # :github
    # auth_hashはOmniAuthからの認証情報を含むハッシュ
    # 例: {
    #   provider: 'github',
    #   uid: '123456',
    #   info: {
    #     nickname: 'example_user',
    #     image: 'https://example.com/image.jpg'
    #   }
    # } 
    # このメソッドは、OmniAuthからの認証情報を使用してユーザーを検索または作成します 
    uid = auth_hash[:uid] # ユーザーID
    nickname = auth_hash[:info][:nickname] # ユーザーのニックネーム
    image_url = auth_hash[:info][:image] # ユーザーの画像URL

    User.find_or_create_by!(provider: provider, uid: uid) do |user|
      # debugger # デバッグ用のブレークポイントを追加
      # find_or_create_by!メソッドは、指定された条件に一致するレコードが存在しない場合に新しいレコードを作成します
      user.name = nickname
      user.image_url = image_url
    end
  end
end
