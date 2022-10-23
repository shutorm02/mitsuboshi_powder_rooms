module ApplicationHelper
  def default_meta_tags
    {
      site: '三つ星トイレ',
      title: '日本各地のキレイで設備豊富なトイレが探せる検索サービス',
      reverse: true,
      separator: '|',
      description: '「三つ星トイレ」は、家の外でもキレイなトイレを使いたい…！という人のためのトイレ検索サービス。現在地やお近くのスポット・こだわりや評価から、あなたのお気に入りのトイレを見つけよう！',
      keywords: '三つ星トイレ, キレイなトイレ',
      charset: 'UTF-8',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('favicon.png'), sizes: '32x32' },
        { href: image_url('icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: '三つ星トイレ',
        title: '日本各地のキレイで設備豊富なトイレが探せる検索サービス',
        description: '「三つ星トイレ」は、家の外でもキレイなトイレを使いたい…！という人のためのトイレ検索サービス。現在地やお近くのスポット・こだわりや評価から、あなたのお気に入りのトイレを見つけよう！',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@mitsuboshi_PR',
      },
    }
  end
end
