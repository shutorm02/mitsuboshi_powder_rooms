module ApplicationHelper
  def default_meta_tags
    {
      title: '三つ星トイレ - 日本各地のキレイで設備豊富なトイレが探せる、トイレ検索サービス',
      description: '「三つ星トイレ」は、たとえ家の外であっても、 三つ星ホテルのようにキレイなトイレを使いたい…、そんな人のためのトイレ検索サービスです。現在地やお近くのスポット、設備などから、あなたのお気に入りのトイレを見つけよう！',
      keywords: '三つ星トイレ, キレイなトイレ',
      charset: 'UTF-8',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_pack_tag 'media/images/favicon.png', sizes: '32x32' },
        { href: image_pack_tag 'media/images/icon.svg', rel: 'apple-touch-icon', sizes: '180x180', type: 'image/svg' },
      ],
      og: {
        title: '三つ星トイレ - 日本各地のキレイで設備豊富なトイレが探せる、トイレ検索サービス',
        description: '「三つ星トイレ」は、たとえ家の外であっても、 三つ星ホテルのようにキレイなトイレを使いたい…、そんな人のためのトイレ検索サービスです。現在地やお近くのスポット、設備などから、あなたのお気に入りのトイレを見つけましょう。',
        type: 'website',
        url: request.original_url,
        image: image_pack_tag 'media/images/ogp.svg',
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@mitsuboshi_PR',
      }
    }
  end
end
