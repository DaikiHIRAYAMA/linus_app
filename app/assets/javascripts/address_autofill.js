$(function() {
    return $('#user_postcode').jpostal({
      postcode: ['#user_postcode'],
      address: {
        '#user_prefecture_code': '%3',
        '#user_address_city': '%4',
        '#user_address_street': '%5%6%7',
      },
    });
  });

  $(function() {
    return $('#company_postcode').jpostal({
      postcode: ['#company_postcode'],
      address: {
        '#company_prefecture_code': '%3',
        '#company_address_city': '%4',
        '#company_address_street': '%5%6%7',
      },
    });
  });