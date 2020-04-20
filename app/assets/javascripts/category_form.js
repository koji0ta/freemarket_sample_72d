$(document).on('turbolinks:load', function(){
  
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    let html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  
  function appendChidrenBox(insertHTML){
    let childSelectHtml = '';
    childSelectHtml = `<div class='status__details__categories__added' id='children-form-box'>
                        <select class='item-select-field' id="child_category" name="item[category_id]">
                          <option value="---" data-category="---">---</option>
                          ${insertHTML}
                        <select>
                      </div>`;
    $('.item-new-box__status__details__categories').append(childSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='status__details__categories__added' id='grandchildren-form-box'>
                              <select class='item-select-field' id="grandchild_category" name="item[category_id]">
                                <option value="---" data-category="---">---</option>
                                ${insertHTML}
                              <select>
                            </div>`;
    $('.item-new-box__status__details__categories').append(grandchildSelectHtml);
  }

  $('#parent_category').on('change', function(){
    let parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーのidを取得
    if (parentCategory != null){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })

      .done(function(children){
        $('#children-form-box').remove(); //親が変更された時、子以下を削除する
        $('#grandchildren-form-box').remove();
        let insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children-form-box').remove(); //親カテゴリーが初期値になった時、子以下を削除する
      $('#grandchildren-form-box').remove();
    }
  });

  $('.item-new-box__status__details__categories').on('change', '#child_category', function(){
    let childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren-form-box').remove(); //子が変更された時、孫以下を削除する
          let insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren-form-box').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
    }
  });
});